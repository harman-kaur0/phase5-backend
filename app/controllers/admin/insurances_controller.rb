class InsurancesController < ApplicationController
    before_action :authorized
    before_action :set_insurance, only: [:show, :update, :destroy]
    def index
        insurances = Insurance.all
        render json: insurances
    end

    def show
        render json: insurance
    end

    def create
        insurance = Insurance.new(insurance_params)

        if insurance.save
            render json: insurance, status: :created
        else
            render json: {error: insurance.errors}, status: :unprocessable_entity
        end
    end

    def update
        if insurance.update(insurance_params)
            render json: insurance
        else
            render json: {error: insurance.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        insurance.destroy
    end

    private
    def set_insurance
        insurance = Insurance.find(params[:id])
    end

    def insurance_params
        params.require(:insurance).permit(:patient_id, :group_number, :name, :subscriber_name, :subscriber_number)
    end
end
