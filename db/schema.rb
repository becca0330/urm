# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120324063508) do

  create_table "answers", :force => true do |t|
    t.integer  "report_id"
    t.integer  "question_id"
    t.integer  "person_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attributes_of_people", :force => true do |t|
    t.integer  "custom_attribute_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
  end

  create_table "custom_attributes", :force => true do |t|
    t.integer  "order"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", :force => true do |t|
    t.integer  "report_id"
    t.integer  "person_id"
    t.string   "devicetype"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_of_reports", :force => true do |t|
    t.integer  "document_id"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "listat"
    t.text     "description"
    t.text     "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doctype"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "documents_of_findings", :force => true do |t|
    t.integer  "document_id"
    t.integer  "finding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventcodes", :force => true do |t|
    t.string   "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "findings", :force => true do |t|
    t.integer  "report_id"
    t.string   "findingtype"
    t.integer  "priority"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
    t.integer  "person_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "gender"
    t.integer  "age"
    t.string   "occupation"
    t.text     "itexperience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "education"
    t.integer  "report_id"
    t.integer  "persontype_id"
    t.string   "itexperience_level"
    t.integer  "itexperience_pcusageinyears"
    t.integer  "itexperience_pcusageperweek"
    t.string   "itexperience_mainoperatingsystem"
    t.integer  "itexperience_webusageperweek"
    t.string   "itexperience_internetconnection"
    t.string   "itexperience_mainwebbrowser"
    t.string   "itexperience_description"
    t.string   "hasusabtestexperience"
    t.datetime "timestamp"
    t.text     "annotation"
  end

  create_table "persontypes", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qandas", :force => true do |t|
    t.text     "quest"
    t.text     "answ"
    t.integer  "interview_id"
    t.integer  "qid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "order"
    t.integer  "report_id"
    t.text     "description"
    t.text     "notice"
    t.string   "rangefrom"
    t.string   "rangeto"
    t.string   "rangescale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "timestamp"
    t.text     "description"
    t.text     "executive_summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "introduction"
    t.text     "methodology"
    t.text     "training"
    t.text     "person_description"
    t.text     "environment_description"
    t.text     "task_description"
    t.text     "heuristicissues_description"
    t.text     "questionnaire_description"
    t.text     "questionnaireresults_description"
    t.text     "interviews_description"
    t.text     "transcripts_description"
    t.text     "analysis_description"
    t.text     "appendix_description"
    t.integer  "order"
    t.string   "testtype"
    t.text     "questionnaireresults_summary"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "task_results", :force => true do |t|
    t.integer  "report_id"
    t.integer  "person_id"
    t.integer  "durationactual"
    t.integer  "completion"
    t.boolean  "withassistance"
    t.text     "notice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.time     "start"
    t.time     "end"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "order"
    t.string   "title"
    t.text     "description"
    t.text     "prerequisite"
    t.text     "possiblesolutionpath"
    t.text     "endingcriteria"
    t.integer  "durationscheduled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
  end

  create_table "todos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "solved"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transcript_events", :force => true do |t|
    t.integer  "report_id"
    t.integer  "person_id"
    t.datetime "timestamp"
    t.integer  "eventcode_id"
    t.text     "event"
    t.integer  "finding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "email",                               :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "single_access_token",                 :null => false
    t.string   "perishable_token",                    :null => false
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "name",                :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "videos", :force => true do |t|
    t.integer  "person_id"
    t.string   "doctype"
    t.text     "description"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

end
