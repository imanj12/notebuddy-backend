class Api::V1::TagsController < ApplicationController

   def index 
      render json: Tag.all
   end

   def show
      render json: Tag.find(params[:id])
   end

   def create
      render json: Tag.create(tag)
   end

   def update
      Tag.find(params[:id]).update(tag)
      render json: Tag.find(params[:id])
   end

   def destroy
      render Tag.find(params[:id]).destroy
   end

   private

   def tag
      params.require(:tag).permit(:name, :user_id)
   end

end
