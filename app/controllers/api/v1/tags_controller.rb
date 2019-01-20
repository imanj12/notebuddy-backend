class Api::V1::TagsController < ApplicationController

   def index 
      render json: Tag.all
   end

   def show
      render json: Tag.find(params[:id])
   end

   def create
      @tag = Tag.create(tag_params)
      if @tag.valid?
         render json: TagSerializer.new(@tag)
      else
         render json: {message: 'Tag creation failed', errors: @tag.errors}
      end
      # render json: Tag.create(tag_params)
   end

   def update
      render Tag.find(params[:id]).update(tag_params)
   end

   def destroy
      render Tag.find(params[:id]).destroy
   end

   private

   def tag_params
      params.require(:tag).permit(:name, :user_id)
   end

end
