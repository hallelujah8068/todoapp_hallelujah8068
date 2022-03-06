class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
        @board = Board.find(params[:board_id])
        @tasks = @board.tasks
    end

    def show
        board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
    end

    def new
        @board = Board.find(params[:board_id])
        @task = @board.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to board_tasks_path(params[:board_id]), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗したよ'
            render :new
        end
    end

    def  edit
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
    end

    def update
        board = Board.find(params[:board_id])
        @task = board.tasks.find(params[:id])
        if @task.update(task_params)
          redirect_to board_tasks_path(params[:board_id]), notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end 
    end

    def destroy
        board = Board.find(params[:board_id])
        task = board.tasks.find(params[:id])
        task.destroy!
        redirect_to board_tasks_path(params[:board_id]), notice: '削除に成功しました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :description, :eyecatch, :deadline, :board_id)
    end
end