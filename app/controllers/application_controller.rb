class ApplicationController < ActionController::API
    SECRET = Rails.application.secrets.secret_key_base.to_s

    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, SECRET)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header 
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, SECRET)[0]
            rescue JWT::DecodeError
                nil
            end
        end   
    end

    def current_user
        if decoded_token
            employee_id = decoded_token['employee_id']
            employee = Employee.find_by(id: employee_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
    end
end
