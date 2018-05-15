require 'rails_helper'

describe Api::CommentsController do
	describe "GET #show" do
		context 'when a proper id is passed' do
			it 'returns back the comment' do
				comment = create(:comment)
				get :show, params: { id:  comment.id  }
				expect(response).to be_success      
			end
		end

		context 'when comment does not exist' do
			it 'returns back the comment' do
				get :show, params: { id:  'bad-id' }
				expect(response).to have_http_status(400)
			end
		end
	end

	describe "POST #create" do
		context 'when proper data is passed' do
			it 'returns returns a 200' do
				doctor = create(:doctor)
				author = create(:author)
				rating = [*0..5].sample
				comment_body = Faker::HarryPotter.quote
				post :create, params: {doctor_id: doctor.id, author_id: author.id, rating: rating, comment_body: comment_body}
				expect(response).to be_success      

			end
		end

		context 'when you are missing the doctor' do
			it 'returns returns a 400' do
				author = create(:author)
				rating = [*0..5].sample
				comment_body = Faker::HarryPotter.quote
				post :create, params: {author_id: author.id, rating: rating, comment_body: comment_body}
				expect(response).to have_http_status(400)      
			end
		end
	end

	describe "PATCH #update" do
		context 'when comment does not exist' do
			it 'returns back the comment' do
				patch :update, params: { id:  'bad-id' }
				expect(response).to have_http_status(400)
			end
		end

		context 'you send proper data to update' do
			it 'updates and returns a 200' do
				comment = create(:comment)
				patch :update, params: { id: comment.id, rating: comment.rating + 10 }
				expect(response).to be_success
				body = JSON.parse(response.body)
				expect(body["rating"]).to equal(comment.rating + 10)     
			end
		end
	end

	describe "POST #mark_inactive" do
		context 'when active is true' do
			it 'should return comment with false active field' do
				comment = create(:comment, active: true)
				post :mark_inactive, params: { id: comment.id }
				body = JSON.parse(response.body)
				expect(body["active"]).to equal(false)
			end
		end

	end



end
