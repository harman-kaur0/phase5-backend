class Admin::LabResultsController < ApplicationController
    before_action :authorized
    before_action :set_lab_results, only: [:show, :update, :destroy]
    
    def index
        lab_results = LabResult.all
        render json: lab_results
    end

    def show
        render json: @lab_results
    end

    def create
        lab_results = LabResult.new(lab_results_params)

        if lab_results.save
            render json: lab_results, status: :created
        else
            render json: {error: lab_results.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @lab_results.update(lab_results_params)
            render json: @lab_results
        else
            render json: {error: @lab_results.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @lab_results.destroy
    end

    private
    def set_lab_results
        @lab_results = LabResult.find(params[:id])
    end

    def lab_results_params
        params.permit(:patient_id, :name, :date, :url, :doctor_name)
    end
end
