class CongressController < ApplicationController
  skip_before_action :verify_authenticity_token
  include Container::Import[:repo]

  def index
  end

  def csv
    dir = Rails.root.join("public/uploads/files/")
    if !Dir[dir + '*.csv'].empty?
      flash[:alert] = "Já existe um csv importado"
      return render "index"
    end

    ext = File.extname(params[:csv].original_filename)
    file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
    path = Rails.root.join("public/uploads/files/", file_name)

    File.open(path, "wb") {|f| f.write(params[:csv].read)}

    Workers::RegisterExpenses.perform_async(csv)
    flash[:alert] = "É possível haver uma demora em completar todas as informações dos deputados"
    return render "index"
  end

  def congress_list
    @congresspeople = repo.all_congresspeople(params[:page])
  end

  def congressperson_details
    @sumarize_expenses = repo.sum_expenses_congressperson(params[:id].to_i)
    @list_expenses = repo.list_expenses(params[:id].to_i, params[:page])
    @ide_cadastro = repo.get_ide_Cadastro(params[:id].to_i)
    @max_expense = repo.get_max_expense(params[:id].to_i)
  end
end
