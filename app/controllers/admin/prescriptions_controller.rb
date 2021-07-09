class Admin::PrescriptionsController < ApplicationController
    before_action :authorized
    before_action :set_prescription, only: [:show, :update, :destroy]
    def index
        prescriptions = Prescription.all
        render json: prescriptions
    end

    def show
        render json: @prescription
    end

    def create
        prescription = Prescription.new(prescription_params)

        if prescription.save
            render json: prescription, status: :created
        else
            render json: {error: prescription.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @prescription.update(prescription_params)
            render json: @prescription
        else
            render json: {error: @prescription.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @prescription.destroy
    end

    private
    def set_prescription
        @prescription = Prescription.find(params[:id])
    end

    def prescription_params
        params.require(:prescription).permit(:patient_id, :employee_id, :name, :directions, :quantity, :approved, :notes)
    end
end
