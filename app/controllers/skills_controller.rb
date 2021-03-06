class SkillsController < ApplicationController
  def index
    @skills = policy_scope(Skill)
    if params[:name].present?
      @skills = Skill.where("name Ilike ?", "%#{params[:name]}%")
    else
      @skills = policy_scope(Skill)
    end



  end

  def new
    @user = current_user
    @skill = Skill.new
    authorize @skill
  end

  def create
    @user = current_user
    @skill = Skill.new (skill_params)
    @skill.user = @user
    authorize @skill
    if @skill.save
      redirect_to user_path(current_user.id)
    else
      render :index
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @booking = Booking.new
    authorize @booking
    authorize @skill
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    authorize @skill

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to skills_path
  end


  def edit
    @skill = Skill.find(params[:id])
    authorize @skill
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    authorize @skill

    # no need for app/views/restaurants/update.html.erb
    redirect_to skill_path(@skill)
  end



  private

  def skill_params
    params.require(:skill).permit(:name, :price)
  end
end
