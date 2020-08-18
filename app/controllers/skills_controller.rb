class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def new
    @user = current_user
    @skill = Skill.new
  end

  def create
    @user = current_user
    @skill = Skill.new (skill_params)
    @skill.user = @user
    if @skill.save
      redirect_to @skill
    else
      render :index
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :price)
  end

end
