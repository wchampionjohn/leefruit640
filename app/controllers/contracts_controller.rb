class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)

    if @contract.save
      redirect_to new_contract_path, notice: '留言成功 ! 我們會盡快回覆您。'
    else
      flash[:alert] = @contract.errors.full_messages.join(',')
      render :new
    end
  end


  private
  def contract_params
    params.require(:contract).permit(:name, :phone_number, :email, :message)
  end

end
