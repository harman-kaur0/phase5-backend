class Admin::AuthenticationController < ApplicationController
    skip_before_action :authorized, only: [:login, :getemployee]


    def login
        employee = Employee.find_by(username: params[:username])
        if employee && employee.authenticate(params[:password])
            token = encode_token(employee_id: employee.id)
            render json: {employee: EmployeeSerializer.new(employee), jwt: token}, status: :created
        else
            render json: {error: "incorrect username or password"}, status: :unauthorized
        end
    end

    def getemployee
        employee = Employee.find(decoded_token["employee_id"])
        if employee
            render json: {employee: EmployeeSerializer.new(employee)}, status: :accepted
        end
    end

    private

    def employee_params
        params.permit(:email, :username, :password, :name, :role, :title)
    end
end