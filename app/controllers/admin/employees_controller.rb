class Admin::EmployeesController < ApplicationController

    before_action :authorized
    skip_before_action :authorized, only: [:create]
    before_action :set_employee, only: [:show, :update, :destroy]

    # getting the employees with doctor role
    def doctors
        doctors = Employee.all.map{|emp| emp.role == "doctor"}
        render json: doctors
    end

    def show
        render json: employee
    end

    
    def create
        employee = Employee.new(employee_params)
        puts employee
        if employee.save
            token = encode_token({employee_id: employee.id})
            render json: {employee: EmployeeSerializer.new(employee), jwt: token}, status: :created
        else 
            render json: {error: employee.errors}, status: :unauthorized 
        end
    end

    def update
        if employee.update(employee_params)
            render json: employee
        else
            render json: {error: employee.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        employee.destroy
    end

    private
    def set_employee
        employee = Employee.find(params[:id])
    end

    def employee_params
        params.permit(:name, :role, :email, :username, :password, :title)
    end
end
