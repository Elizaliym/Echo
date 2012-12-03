require 'rubygems'
require 'eventmachine'

class EchoServer < EventMachine::Connection
    def post_init
        puts "Подключаемся..."
    end

    def receive_data data
        send_data ">>> #{data}"
        close_connection if data =~ /quit/i
    end

    def unbind
        puts "Отключились..."
    end
end

EventMachine::run {
    EventMachine::start_server '127.0.0.1', 8081, EchoServer
}