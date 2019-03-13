require 'open-uri'
require 'json'
require 'pp'

CURRENT_YEAR = 2019

def values(fake = false)
  data = nil
  if !fake
    sheet = '1GB5UEw9E3xEQoVU__K8QwPF4EbpsAkqUqxfd0LfmJio'
    token = open('TOKEN', 'r').read
    range = 'Respostas!A%3AG'
    uri = format('https://sheets.googleapis.com/v4/spreadsheets/%s/values/%s?key=%s', sheet, range, token)

    data = open(uri).read(&:read)
  else
    data = '{
      "range": "Respostas!A1:G102",
      "majorDimension": "ROWS",
      "values": [
        [
          "Carimbo de data/hora",
          "Nome para exibição no ranking",
          "Ano que ingressou, ou pretende ingressar na faculdade (importante para definir a categoria)",
          "handle do Codeforces (necessário para calcular a sua posição no ranking):",
          "Instituição de ensino atual",
          "Login do Telegram (para adicionarmos você no nosso grupo)",
          "Endereço de e-mail"
        ],
        [
          "15/11/2018 16:47:45",
          "Emilio Wuerges",
          "2002",
          "wuerges",
          "UFFS",
          "@wuerges",
          "wuerges@gmail.com"
        ]
      ]
    }'
  end

  result = JSON.parse(data)['values']
  result.shift
  result
end


class User < ApplicationRecord
  # attr_reader :name, :year, :handle, :inst, :telegram, :email

  # @@users = []

  # def initialize(name, year, handle, inst, telegram, email)
  #   @name = name
  #   @year = year
  #   @handle = handle
  #   @inst = inst
  #   @telegram = telegram
  #   @email = email
  #   @ratings = []
  # end

  def load_data!
    url = format('https://codeforces.com/api/user.rating?handle=%s', self.handle)
    data = open(url, &:read)
    result = JSON.parse(data)['result']

    self.ratings = JSON.generate(result.sort_by { |v| v['contestId'] }.collect { |v| v['newRating'].to_i })
  end

  def rating
    res = JSON.parse(ratings)
    if res.any?
       res.last
    else
       0
    end
  end

  def self.load_all!
    User.delete_all
    values.each do |value|
      _, name, year, handle, inst, telegram, email = value
      user = User.new(name: name, year: year.to_i, handle: handle, inst: inst, telegram: telegram, email: email)
      user.load_data!
      user.save
    end
  end

  def self.senior
    # User.load_all!
    User.all
  end

  def self.junior
    User.where("year >= ?", CURRENT_YEAR)
  end

  def self.prodigio
    User.where("year > ?", CURRENT_YEAR)
  end

end
