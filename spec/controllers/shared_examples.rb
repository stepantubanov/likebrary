shared_examples_for 'requires authentication' do
  context 'when not authenticated' do
    it 'redirects to the sign in page' do
      perform_action
      response.should redirect_to new_user_session_path
    end
  end
end
