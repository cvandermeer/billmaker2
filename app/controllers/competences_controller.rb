class CompetencesController < ApplicationController
  before_action :set_competence, only: [:destroy]

  def create
    @competence = Competence.new(competence_params)
    render @competence, bill: @bill if @competence.save
  end

  def destroy
    @competence.destroy
    redirect_to bill_path(@competence.bill), status: 303
  end

  private

  def set_competence
    @competence = Competence.find(params[:id])
  end

  def competence_params
    params.require(:competence).permit(:title, :points, :level, :bill_id)
  end
end
