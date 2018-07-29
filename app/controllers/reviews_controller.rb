class ReviewsController < ApplicationController

  def show
    @show_review= Review.find(params[:id])
    @review = Review.new
  end

  def create
  	movie = Movie.find(params[:movie_id])
  	review = Review.new(review_params)
  	if params[:score].blank?
  		review.score = 0.0
  	else
  		review.score = params[:score]
  	end
  	review.user_id = current_user.id
  	review.movie_id = movie.id
  	review.save
    flash[:success] = "レビューを投稿しました"
    # sucore_avrageに関して
    # スコアが０点ではなかった時のみ、処理をする
    unless review.score == 0.0
      # もし最初の投稿で、スコアアベレージがまだ０点だった場合
      if movie.score_average == 0.0
        movie.update(score_average: review.score)
      else
        sum = movie.score_average + review.score
        average = sum/2
        movie.update(score_average: average)
      end
    end

  	redirect_to movie_path(movie)
  end

  def update
  	review = Review.find(params[:id])
  	movie = Movie.find(params[:movie_id])
  	if params[:score].blank?
  		review.score = 0.0
  	else
  		review.score = params[:score]
  	end
  	review.update(review_params)
    # sucore_avrageに関して
    # スコアが０点ではなかった時のみ、処理をする
    unless review.score == 0.0
      # もし最初の投稿で、スコアアベレージがまだ０点だった場合
      if movie.score_average == 0.0
        movie.update(score_average: review.score)
      else
        reviews = Review.where(movie_id: movie.id).where.not(score: 0.0)
        total_score = 0
        reviews.each do |r|
          total_score += r.score
        end
        score_average = total_score / reviews.count
        movie.update(score_average: score_average)
      end
    end

  	redirect_to movie_path(movie)
  end

  def destroy
  	review = Review.find(params[:id])
  	movie = Movie.find(params[:movie_id])
  	review.destroy
    flash[:danger] = "レビューを削除しました"

    reviews = Review.where(movie_id: movie.id).where.not(score: 0.0)
    if reviews.present?
      total_score = 0
      reviews.each do |r|
        total_score += r.score
      end
      score_average = total_score / reviews.count
      movie.update(score_average: score_average)
    else
      movie.update(score_average: 0.0)
    end

  	redirect_to movie_path(movie)
  end

  private
    def review_params
        params.require(:review).permit(:comment, :score, :secret, :movie_id, :user_id)
    end
end
