class ArticlesController < ApplicationController

    include Paginable

    def index
        paginated = paginate(Article.recent)
        render_collection(paginated)
    end

    def show
        article = Article.find(params[:id])
        render json: response_json("Article loaded correctly", article), status: :ok
    end

    def serializer
        ArticleSerializer
    end

    private
    def response_json(message, data, error = false)
        {
            status: (!error) ? "Successfully" : "Error",
            message: message,
            data: (!error) ? data : data.error
        }
    end
end