class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)          # comment = Comment.create(comment_params)
    redirect_to team_path(params[:team_id]) # "/teams/#{comment.team.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, team_id: params[:team_id])
  end
end