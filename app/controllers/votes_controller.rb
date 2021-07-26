class VotesController < ApplicationController
    def new
        @vote = Vote.new
    end

    def create
        @vote = current_user.votes.new(article_id: params[:article_id])

        if @vote.save
            redirect_to article_path(params[:article_id]), notice: 'You gave a vote to this article'
        else
            redirect_to article_path(params[:article_id]), alert: 'You cannot give a vote to this article'
        end
    end

    def destroy
        vote = Vote.find_by(id:params[:id], user_id: current_user.id, article_id: params[:article_id])

        if vote
            vote.destroy
            redirect_to article_path(params[:article_id]), notice: 'You unvote this article'
        else
            redirect_to article_path(params[:article_id]), notice: 'You cannot unvote this article'
        end
    end
end
