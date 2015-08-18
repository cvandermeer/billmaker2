class CompetencesController < ApplicationController
  def create
    @competence = Competence.new(competence_params)
    render @competence, bill: @bill if @competence.save
  end

  private

  def competence_params
    params.require(:competence).permit(:title, :points, :level, :bill_id)
  end
end
