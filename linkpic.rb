# linkpic.rb

require 'rodent'
require 'selenium-webdriver'

class LinkPic
  attr_accessor :name, :email

  def initialize(options)
    @header_id = options['header_id']
    @link = options['link']
    @screenshot
	
  end

  def say_cheese(options)

      width  = 1920
      height = 1080
      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to options['link']
      driver.execute_script %Q{
         window.resizeTo(#{width}, #{height});
      }
      screenshot = driver.save_screenshot()
      driver.quit
  end
end

class LinkPicAPI < Rodent::Base
  listen 'linkpic.create' do
    self.status = 201

    @linkpic = LinkPic.new(params)
    say_cheese(options['link'])
	  Url.where("link = ? && "data = nil && header_id ?", params['link','header_id'].update(:data => screenshot)
    @linkpic.as_json
  end
end

class LinkPicServer < Rodent::Server
  configure do
    set :connection, 'amqp://guest:guest@localhost'
  end

  run do
    Signal.trap('INT') { Rodent::Server.stop }

    [LinkPicAPI]
  end
end