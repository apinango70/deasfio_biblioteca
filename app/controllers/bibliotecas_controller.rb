class BibliotecasController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #Condicional para filtrar por estado del libro en el index
    if params[:estado].present?
      @bibliotecas = Biblioteca.where('estado = ?',params[:estado])
    else
      @bibliotecas = Biblioteca.all
    end
      
    @q = Biblioteca.ransack(params[:q])
    @bibliotecas = @q.result(distinct: true)

  end




  def new
    @biblioteca = Biblioteca.new
  end

  def create
    params.permit!
    @biblioteca = Biblioteca.new(biblioteca_params)
    if @biblioteca.save
      redirect_to @biblioteca, notice: "El libro fue creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end



  def show
    @biblioteca = Biblioteca.find(params[:id])
  end

  def edit
    @biblioteca = Biblioteca.find(params[:id])
  end

  def update
    params.permit!
    @biblioteca = Biblioteca.find(params[:id])
      if @biblioteca.update(biblioteca_params)
        redirect_to @biblioteca, notice: "El libro fue actualizado correctamente."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @biblioteca = Biblioteca.find(params[:id])
    @biblioteca.destroy
    redirect_to bibliotecas_url, notice: "El libro ha sido eliminado."
  end

  def biblioteca_params
    params.require(:biblioteca).permit(:titulo, :autor, :estado, :fecha_prestamo, :fecha_devolucion)
  end
end
