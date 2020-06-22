class PatientsController < ApplicationController
  def index
    @patient = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Patient.find(params[:id])
    patient.update!(patient_params)
    redirect_to patient
  end

  def create
    @patient = Patient.create!(patient_params)
    if @patient.save
      redirect_to "/patients/#{@patient.id}", success: "Patient Added Successfully"
    else
      redirect_to "patients/create", danger: "Patient details not added"
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def destroy 
     @patient = Patient.find(params[:id])
     if @patient.destroy
       redirect_to "/patients" , danger: "User was deleted"
     else
       redirect_to "/patients/#{@patient.id}", danger: "Patient cannot be deleted"
     end
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :age, :dept, :phone, :email)
  end
end
