class Role < ActiveRecord::Base
  has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end
    def lead
        lead_actor = self.auditions.where(hired: true).first
        lead_actor == nil? "no actors here" : lead_actor
        # if self.auditions.find_by(hired: true)
    end

    def understudy
        under_study = self.auditions.where(hired: true).second
        under_study == nil? "no actors here" : under_study 
    end
end