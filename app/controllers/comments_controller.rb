class CommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to board_task_path(task.board_id, task), notice: 'コメントを追加したよ'
        else
            flash.now[:error] = 'コメントに失敗したよ'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end