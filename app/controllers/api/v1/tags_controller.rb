class Api::V1::TagsController < ApplicationController

   def index 
      render json: Tag.all
   end

   def show
      render json: Tag.find(params[:id])
   end

   def create
      render json: Tag.create(tag_params)
   end

   def update
      Tag.find(params[:id]).update(tag_params)
      render json: Tag.find(params[:id])
   end

   def destroy
      render Tag.find(params[:id]).destroy
   end

   private

   def tag_params
      params.require(:tag).permit(:name, :user_id)
   end

end
