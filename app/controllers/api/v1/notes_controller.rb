class Api::V1::NotesController < ApplicationController

   def index 
      render json: Note.all
   end

   def show
      render json: Note.find(params[:id])
   end

   def create
      render json: Note.create(note_params)
   end

   def update
      @note = Note.find(params[:id])
      @note.note_tags.destroy_all
      @note.update(note_params)
      render json: Note.find(params[:id])
   end

   def destroy
      render Note.find(params[:id]).destroy
   end

   private

   def note_params
      params.require(:note).permit(:title, :content, :location, :user_id, note_tags_attributes: [:tag_id])
   end

end
