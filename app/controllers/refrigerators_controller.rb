class RefrigeratorsController < ApplicationController

  def index

    @refrigerators = Refrigerator.all

    # 寸法検索
    if params[:width].blank? &&
    (params[:depth].present? || params[:height].present?)

      flash.now[:alert] = "横幅だけでも入力ください"

    elsif params[:width].present?

      @refrigerators =
        @refrigerators.where("width <= ?", params[:width])

      if params[:depth].present?
        @refrigerators =
          @refrigerators.where("depth <= ?", params[:depth])
      end

      if params[:height].present?
        @refrigerators =
          @refrigerators.where("height <= ?", params[:height])
      end

    elsif params[:width].blank? &&
          params[:depth].blank? &&
          params[:height].blank? &&
          params[:commit] == "寸法検索"

      flash.now[:alert] = "横幅だけでも入力ください"
    end

    # 容量検索
    if params[:min_volume].present? &&
          params[:max_volume].present?

      @refrigerators = @refrigerators
        .where(volume: params[:min_volume]..params[:max_volume])
    end

    # 並び替え
    case params[:sort]

    when "volume_desc"
      @refrigerators =
        @refrigerators.order(volume: :desc)

    when "volume_asc"
      @refrigerators =
        @refrigerators.order(volume: :asc)

    when "freezer_desc"
      @refrigerators =
        @refrigerators.order(freezer_capacity: :desc)

    when "icemaker_desc"
      @refrigerators =
        @refrigerators.order(icemaker: :desc)

    when "refrige_desc"
      @refrigerators =
        @refrigerators.order(refrige: :desc)

    when "vegetable_desc"
      @refrigerators =
        @refrigerators.order(vegetable: :desc)

    when "switched_desc"
      @refrigerators =
        @refrigerators.order(switched: :desc)

    when "power_asc"
      @refrigerators =
        @refrigerators.order(annual_power_consumption: :asc)

    end
  end

  def new
    @refrigerator = Refrigerator.new
  end

  def create
    @refrigerator = Refrigerator.new(refrigerator_params)

    if @refrigerator.save
      redirect_to root_path, notice: "登録しました"
    else
      render :new
    end
  end

  private

  def refrigerator_params
    params.require(:refrigerator).permit(
      :model_name,
      :manufacturer,
      :width,
      :depth,
      :height,
      :volume,
      :freezer_capacity,
      :refrige,
      :vegetable,
      :icemaker,
      :switched,
      :price
    )
  end
end
