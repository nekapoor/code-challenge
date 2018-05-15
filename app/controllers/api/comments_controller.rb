module Api
	class CommentsController < ApiController
	  skip_before_action :verify_authenticity_token
		before_action :set_comment, only: [:show, :update, :mark_inactive]

		def show
			render json: @comment, status: :ok
		end

		def create
			@comment = Comment.new(comment_params)
			if @comment.save
				render json: {comment: @comment, recommenations: recommendations}, status: :ok
			else
				render json: { status: "error", messages: @comment.errors.full_messages }, status: 400
			end
		end

		def update
			@comment.update(comment_params)
			render json: @comment, status: :ok
		end

		def mark_inactive
			@comment.update(active: false)
			render json: @comment, status: :ok
		end

		private

		def recommendations
			DoctorRecommendation.new(@comment).recommendations
		end

		def set_comment
			@comment = Comment.find_by(id: params[:id])
			render json: {status: "error", message: "Unable to find comment." }, status: 400 unless @comment
		end
	
		def comment_params
			params.permit(:comment_body, :rating, :active, :author_id, :doctor_id)
		end

	end
end