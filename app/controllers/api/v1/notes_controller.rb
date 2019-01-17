class Api::V1::NotesController < ApplicationController

   def index 
      render json: Note.all
   end

   def show
      render json: Note.find(params[:id])
   end

   def create
      # @note = Note.new(title: params[:title], content: params[:content], user_id: params[:user_id])
      # params[:tags].each do |tag|
      #    @tag = Tag.find_or_create_by_name(tag[:tag])
      #    @note.tags << @tag
      # end
      # @note.save
      # render json: @note
      render json: Note.create(note_params)
   end

   def update
      @note = Note.find(params[:id])
      @note.note_tags.destroy_all
      # @note.save
      @note.update(note_params)
      # Note.find(params[:id]).update(note_params)
      render json: Note.find(params[:id])
   end

   def destroy
      render Note.find(params[:id]).destroy
   end

   private

   def note_params
      # params.require(:note).permit(:title, :content, :user_id, tags: [])
      params.require(:note).permit(:title, :content, :user_id, note_tags_attributes: [:tag_id])
      # params.require(:note).permit(:title, :content, :user_id).tap do |whitelisted|
      #    whitelisted[:tags] = params[:tags]
      # end
      # params.require(:note).permit(:title, :content, :user_id, note_tags_attributes: [tag_attributes: [:name]])
   end

end
