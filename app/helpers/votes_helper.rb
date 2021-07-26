module VotesHelper
    def vote_unvote_option(article)
        vote = Vote.find_by(user_id: current_user[:id], article_id: article[:id])

        if vote
            button_to('', vote_path(id: vote.id, article_id: article.id),  method: :delete, class: 'border-0 bg-transparent vote voted')
        else
            button_to('', votes_path(article_id: article.id),  method: :post, class: 'border-0 bg-transparent vote unvoted')
        end
    end
end
