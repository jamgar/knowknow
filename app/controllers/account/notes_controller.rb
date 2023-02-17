class Account::NotesController < AccountController
  before_action :set_note, only: %i[ show edit update destroy ]

  def index
    @notes = current_user.notes.all
  end

  def show
  end

  def new
   @note = Note.new
  end

  def create
    @note = current_user.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to account_note_url(@note), notice: "Note was successfully created."}
      else
        format.html { render :new, status: :unprocessable_entity } 
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to account_note_url(@note), notice: "Note was successfully updated."}
      else
        format.html { render :edit, status: :unprocessable_entity } 
      end
    end
  end

  def destroy
   @note.destroy

   respond_to do |format|
    format.html { redirect_to account_notes_url, notice: "Notw was successfully deleted."}
   end
  end

  private

    def set_note
      @note = current_user.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
