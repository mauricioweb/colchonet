class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create 
		@user = User.new(params[:user])

		if @user.save
			redirect_to @user, :notice => 'Cadastro criado com sucesso!'
			SignupMailer.confirm_email(@user).deliver
		else
			render :new 
		end


		def show
   	 		@user = User.find(params[:id])
		end

		def edit
			@user = User.find(params[:id])
		end

		def update
			@user = User.find(params[:id])

			if @user.update_attributes(params[:user])
				redirect_to @user, :notice => 'Cadastro atualizado com sucesso'
			else
				render :edit
			end
			
		end
	end
end