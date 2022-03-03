class TasksController < ApplicationController
    def index
        @tasks = Tasks.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @board = Board.find(params[:board_id])
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to board_tasks_path(@board), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗したよ'
            render :new
        end
    end

    def  edit
        
    end

    def update
        
    end

    def destroy
        
    end

    private
    def task_params
        params.require(:task).permit(:title, :description, :eyecatch, :deadline)
    end
end