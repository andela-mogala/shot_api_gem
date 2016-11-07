module ShotApiGem
    class Link
      attr_reader(
        :id,
        :url,
        :slug,
        :active,
        :clicks,
        :title,
        :date_created,
        :date_updated
      )

      def initialize(params)
        @id = params[:id]
        @url = params[:url]
        @slug = params[:slug]
        @active = params[:active]
        @clicks = params[:clicks]
        @title = params[:title]
        @date_created = params[:date_created]
        @date_updated = params[:date_updated]
      end
    end
end