class PrrojectsController < ApplicationController
  before_action :set_prroject, only: [:show, :edit, :update, :destroy, :users, :add_user]

  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create, :users, :add_user]
  before_action :verify_tenant

  # GET /prrojects
  # GET /prrojects.json
  def index
    @prrojects = Prroject.by_user_plan_and_tenant(params[:tenant_id], current_user)
  end

  # GET /prrojects/1
  # GET /prrojects/1.json
  def show
  end

  # GET /prrojects/new
  def new
    @prroject = Prroject.new
  end

  # GET /prrojects/1/edit
  def edit
  end

  # POST /prrojects
  # POST /prrojects.json
  def create
    @prroject = Prroject.new(prroject_params)
    @prroject.users << current_user

    respond_to do |format|
      if @prroject.save
        format.html { redirect_to root_url, notice: 'Prroject was successfully created.' }
       
      else
        format.html { render :new }
       
      end
    end
  end

  # PATCH/PUT /prrojects/1
  # PATCH/PUT /prrojects/1.json
  def update
    respond_to do |format|
      if @prroject.update(prroject_params)
        format.html { redirect_to root_url, notice: 'Prroject was successfully updated.' }
        
      else
        format.html { render :edit }
       
      end
    end
  end

  # DELETE /prrojects/1
  # DELETE /prrojects/1.json
  def destroy
    @prroject.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Prroject was successfully destroyed.' }
     
    end
  end
  
  def users

    @prroject_users = (@prroject.users + (User.where(tenant_id: @tenant.id, is_admin: true))) - [current_user]
    
    @other_users = @tenant.users.where(is_admin: false) - (@prroject_users + [current_user])

  end
  
  def add_user
  
  @prroject_user = Userprroject.new(user_id: params[:user_id], prroject_id: @prroject.id)
  
  respond_to do |format|
  
  if @prroject_user.save
  
  format.html { redirect_to users_tenant_prroject_url(id: @prroject.id,
  
  tenant_id: @prroject.tenant_id),
  
  notice: 'User was successfully added to prroject' }
  
  else
  
  format.html { redirect_to users_tenant_prroject_url(id: @prroject.id,
  
  tenant_id: @prroject.tenant_id),
  
  error: 'User was not added to prroject' }
  
  end
  
  end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prroject
      @prroject = Prroject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prroject_params
      params.require(:prroject).permit(:title, :details, :expected_completion_date, :tenant_id)
    end
    
    def set_tenant

    @tenant = Tenant.find(params[:tenant_id])
    
    end
    
    def verify_tenant
    
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
      
      redirect_to :root,
      
      flash: { error: 'You are not authorized to access any organization other than your own'}
      
      end
    
    end
end
