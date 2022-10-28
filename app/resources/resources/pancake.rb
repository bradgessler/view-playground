module Resources
  class Pancake < Application
    Index = self

    def html
      render plain: "There are #{scope.count} waffles"
    end

    class Show < self
      def resource
        scope.find params.fetch(:id)
      end

      def html
        render plain: "Got #{resource.inspect} from #{params}"
      end
    end

    class Edit < Show
      def html
        render plain: p("Editing stuff")
      end
    end

    class Update < Show
      def html
        redirect_to resource
      end
    end

    class Destroy < Show
      def html
        resource.destroy
        redirect_to scope
      end
    end

    class New < self
      def resource
        scope.build params.permit :post
      end

      def html
        render :new
      end
    end

    class Create < New
      def html
        if resource.save
          redirect_to resource
        else
          # Hmmm....
        end
      end
    end
  end
end
