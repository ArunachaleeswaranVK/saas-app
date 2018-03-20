class UserPrrojectsController < ApplicationController
  before_action :set_user_prroject, only: [:show, :edit, :update, :destroy]

  # GET /user_prrojects
  # GET /user_prrojects.json
  def index
    @user_prrojects = UserPrroject.all
  end

  # GET /user_prrojects/1
  # GET /user_prrojects/1.json
  def show
  end

  # GET /user_prrojects/new
  def new
    @user_prroject = UserPrroject.new
  end

  # GET /user_prrojects/1/edit
  def edit
  end

  # POST /user_prrojects
  # POST /user_prrojects.json
  def create
    @user_prroject = UserPrroject.new(user_prroject_params)

    respond_to do |format|
      if @user_prroject.save
        format.html { redirect_to @user_prroject, notice: 'User prroject was successfully created.' }
        format.json { render :show, status: :created, location: @user_prroject }
      else
        format.html { render :new }
        format.json { render json: @user_prroject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_prrojects/1
  # PATCH/PUT /user_prrojects/1.json
  def update
    respond_to do |format|
      if @user_prroject.update(user_prroject_params)
        format.html { redirect_to @user_prroject, notice: 'User prroject was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_prroject }
      else
        format.html { render :edit }
        format.json { render json: @user_prroject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_prrojects/1
  # DELETE /user_prrojects/1.json
  def destroy

    @user_prroject.destroy
    
    respond_to do |format|
    
    format.html { redirect_to users_tenant_prroject_url(id: @user_prroject.prroject_id,
    
    tenant_id: @user_prroject.prroject.tenant_id),
    
    notice: 'User was successfully removed from the prroject' }
    
    format.json { head :no_content }
    
    end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_prroject
      @user_prroject = UserPrroject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_prroject_params
      params.require(:user_prroject).permit(:prroject_id, :user_id)
    end
end
