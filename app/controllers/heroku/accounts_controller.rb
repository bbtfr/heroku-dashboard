class Heroku::AccountsController < ApplicationController
  before_action :set_heroku_account, only: [:show, :edit, :update, :destroy]

  # GET /heroku/accounts
  # GET /heroku/accounts.json
  def index
    @heroku_accounts = Heroku::Account.all
  end

  # GET /heroku/accounts/1
  # GET /heroku/accounts/1.json
  def show
  end

  # GET /heroku/accounts/new
  def new
    @heroku_account = Heroku::Account.new
  end

  # GET /heroku/accounts/1/edit
  def edit
  end

  # POST /heroku/accounts
  # POST /heroku/accounts.json
  def create
    @heroku_account = Heroku::Account.new(heroku_account_params)

    respond_to do |format|
      if @heroku_account.save
        format.html { redirect_to @heroku_account, notice: 'Account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @heroku_account }
      else
        format.html { render action: 'new' }
        format.json { render json: @heroku_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heroku/accounts/1
  # PATCH/PUT /heroku/accounts/1.json
  def update
    respond_to do |format|
      if @heroku_account.update(heroku_account_params)
        format.html { redirect_to @heroku_account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @heroku_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroku/accounts/1
  # DELETE /heroku/accounts/1.json
  def destroy
    @heroku_account.destroy
    respond_to do |format|
      format.html { redirect_to heroku_accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heroku_account
      @heroku_account = Heroku::Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heroku_account_params
      params.require(:heroku_account).permit(:apikey)
    end
end
