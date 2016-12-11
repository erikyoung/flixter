class Lesson < ActiveRecord::Base
  belongs_to :section
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :section_id

  def next_lesson
    lesson = course.sections.where("row_order > ?", self.row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    return lesson

  end

end
