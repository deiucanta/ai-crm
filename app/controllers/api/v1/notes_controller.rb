class Api::V1::NotesController < Api::V1::BaseController
  before_action :set_notable, only: [:index, :create]

  def index
    render json: @notable.notes
                   .page(params[:page]).per(params[:count])
  end
  def create
    @note = @notable.notes.new(note_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:note])
    if @note.update(note_params)
      render json: @note, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private

  def set_notable
    @notable = params[:notable_type].classify.constantize.find(params[:notable_id])
  rescue NameError
    render json: { error: 'Invalid notable type' }, status: :unprocessable_entity
  end

  def note_params
    params.require(:note).permit(:body)
  end
end