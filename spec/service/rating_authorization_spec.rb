require './app/service/rating_authorization'

describe RatingAuthorization do
  let(:user) { stub(:user, admin?: false) }
  let(:rating) { stub(:rating) }
  let(:authorization) { RatingAuthorization.new(rating, user) }

  describe '#request!' do
    it 'raises exception when request returns false' do
      authorization.stub(:request).and_return(false)
      expect {
        authorization.request!
      }.to raise_error(RatingAuthorization::NotAuthorizedError)
    end

    it 'continues execution when request returns true' do
      authorization.stub(:request).and_return(true)
      expect {
        authorization.request!
      }.not_to raise_error
    end
  end

  describe '#request' do
    subject { authorization.request }

    let(:rating_author) { stub(:rating_author, admin?: false) }
    before do
      rating.stub(:user).and_return(rating_author)
    end

    context 'when the author of the rating' do
      let(:user) { rating_author }
      it { should be_true }
    end

    context 'when another user' do
      it { should be_false }
    end

    context 'when admin user' do
      let(:user) { stub(:user, admin?: true) }
      it { should be_true }
    end
  end
end
