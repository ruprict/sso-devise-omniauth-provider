# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130201140740) do

  create_table "access_grants", :force => true do |t|
    t.string   "code"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "access_token_expires_at"
    t.integer  "account_id"
    t.integer  "client_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "state"
  end

  create_table "account_device_tokens", :force => true do |t|
    t.integer  "account_id"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "environment", :default => "development", :null => false
  end

  add_index "account_device_tokens", ["account_id"], :name => "index_user_device_tokens_on_user_id"
  add_index "account_device_tokens", ["key"], :name => "index_user_device_tokens_on_key"

  create_table "account_settings", :force => true do |t|
    t.boolean "notify_on_post_liked_via_email",                :default => false, :null => false
    t.boolean "notify_on_post_liked_via_push",                 :default => false, :null => false
    t.boolean "notify_on_post_commented_via_email",            :default => true,  :null => false
    t.boolean "notify_on_post_commented_via_push",             :default => true,  :null => false
    t.boolean "notify_on_comment_replied_via_email",           :default => false, :null => false
    t.boolean "notify_on_comment_replied_via_push",            :default => false, :null => false
    t.boolean "notify_on_user_followed_via_email",             :default => false, :null => false
    t.boolean "notify_on_user_followed_via_push",              :default => false, :null => false
    t.boolean "notify_on_user_mentioned_via_email",            :default => true,  :null => false
    t.boolean "notify_on_user_mentioned_via_push",             :default => true,  :null => false
    t.boolean "notify_on_user_directed_via_email",             :default => true,  :null => false
    t.boolean "notify_on_user_directed_via_push",              :default => true,  :null => false
    t.integer "account_id"
    t.boolean "notify_on_user_mentioned_in_comment_via_push",  :default => true,  :null => false
    t.boolean "notify_on_user_mentioned_in_comment_via_email", :default => true,  :null => false
    t.boolean "notify_on_event_will_start_soon_via_push",      :default => true,  :null => false
    t.boolean "notify_on_event_will_start_soon_via_email",     :default => false, :null => false
    t.boolean "notify_on_event_invite_via_push",               :default => true
    t.boolean "notify_on_event_invite_via_email",              :default => true
    t.boolean "notify_on_private_kyck_via_push",               :default => true
    t.boolean "notify_on_private_kyck_via_email",              :default => true
    t.boolean "notify_on_post_reshared_via_push",              :default => false, :null => false
    t.boolean "notify_on_post_reshared_via_email",             :default => false, :null => false
    t.boolean "show_auto_share_prompt_checkins_twitter",       :default => true
    t.boolean "auto_share_checkins_twitter",                   :default => true
    t.boolean "show_auto_share_prompt_checkins_facebook",      :default => true
    t.boolean "auto_share_checkins_facebook",                  :default => true
    t.boolean "notify_on_team_invite_via_push",                :default => true
    t.boolean "notify_on_team_invite_via_email",               :default => true
    t.boolean "notify_on_team_request_via_push",               :default => true
    t.boolean "notify_on_team_request_via_email",              :default => true
    t.boolean "notify_on_team_mentioned_via_push",             :default => true
    t.boolean "notify_on_team_mentioned_via_email",            :default => true
    t.boolean "notify_on_team_mentioned_in_comment_via_push",  :default => true
    t.boolean "notify_on_team_mentioned_in_comment_via_email", :default => true
    t.boolean "notify_on_user_pending_via_push",               :default => true
    t.boolean "notify_on_user_pending_via_email",              :default => true
  end

  add_index "account_settings", ["account_id"], :name => "index_user_settings_on_user_id"

  create_table "accounts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                                 :default => "",      :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "registration_step",                     :default => "start"
    t.string   "facebook_uid"
    t.string   "facebook_token"
    t.string   "twitter_uid"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.string   "comet_token"
    t.boolean  "admin"
    t.date     "birthday_on"
    t.string   "kind",                                  :default => "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["facebook_uid"], :name => "index_accounts_on_facebook_uid"
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true
  add_index "accounts", ["twitter_uid"], :name => "index_accounts_on_twitter_uid"

  create_table "accounts_roles", :force => true do |t|
    t.integer "role_id"
    t.integer "account_id"
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "ads", :force => true do |t|
    t.string   "url"
    t.string   "sponsor"
    t.string   "image_name"
    t.integer  "rank"
    t.datetime "last_displayed"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "account_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blocks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id",   :null => false
    t.string   "blocker_type", :null => false
    t.integer  "blocked_id",   :null => false
    t.string   "blocked_type", :null => false
  end

  create_table "broadcasts", :force => true do |t|
    t.integer  "tv_channel_id"
    t.integer  "event_id"
    t.boolean  "primary",       :default => true
    t.boolean  "live",          :default => true
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "broadcasts", ["event_id"], :name => "index_broadcasts_on_event_id"
  add_index "broadcasts", ["tv_channel_id"], :name => "index_broadcasts_on_tv_channel_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "app_id"
    t.string   "app_secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_checkins", :force => true do |t|
    t.integer  "event_id"
    t.integer  "attendant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attendant_type", :default => "User", :null => false
    t.boolean  "joined",         :default => true,   :null => false
  end

  add_index "event_checkins", ["attendant_id", "attendant_type"], :name => "index_event_checkins_on_attendant_id_and_attendant_type"
  add_index "event_checkins", ["event_id", "attendant_id"], :name => "index_event_checkins_on_event_id_and_user_id", :unique => true

  create_table "event_invites", :force => true do |t|
    t.string  "kind"
    t.integer "from_id"
    t.integer "to_id"
    t.string  "request_id"
    t.integer "event_id"
    t.string  "to_type",    :default => "User", :null => false
    t.string  "from_type",  :default => "User", :null => false
  end

  add_index "event_invites", ["from_id", "from_type"], :name => "index_event_invites_on_from_id_and_from_type"
  add_index "event_invites", ["to_id", "to_type"], :name => "index_event_invites_on_to_id_and_to_type"

  create_table "event_starters", :force => true do |t|
    t.integer  "event_id"
    t.integer  "player_id"
    t.integer  "shirt_number"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "starting_at"
    t.string   "icon"
    t.float    "icon_ratio"
    t.integer  "checkins_count",                 :default => 0
    t.integer  "posts_count",                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",                           :default => "event",   :null => false
    t.integer  "creator_id"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.text     "description"
    t.integer  "tv_channel_id"
    t.integer  "opta_id"
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.datetime "checkedin_at"
    t.string   "notification_state",             :default => "pending", :null => false
    t.boolean  "final",                          :default => false
    t.integer  "location_id"
    t.string   "icon_transloadit_assembly_id"
    t.string   "creator_type",                   :default => "User"
    t.boolean  "private",                        :default => false
    t.string   "header_image"
    t.string   "header_transloadit_assembly_id"
  end

  add_index "events", ["checkins_count"], :name => "index_events_on_checkins_count"
  add_index "events", ["posts_count"], :name => "index_events_on_posts_count"
  add_index "events", ["starting_at"], :name => "index_events_on_starting_at"

  create_table "invitations", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "birthdate"
    t.boolean  "approved",   :default => false
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "invitations", ["sender_id"], :name => "index_invitations_on_sender_id"

  create_table "knotifications", :force => true do |t|
    t.integer  "recipient_id"
    t.integer  "initiator_id"
    t.boolean  "unread",         :default => true
    t.string   "kind"
    t.integer  "obj_id"
    t.string   "obj_type"
    t.datetime "created_at"
    t.string   "recipient_type", :default => "User", :null => false
    t.string   "initiator_type", :default => "User", :null => false
  end

  add_index "knotifications", ["initiator_id", "initiator_type"], :name => "index_notifications_on_initiator_id_and_initiator_type"
  add_index "knotifications", ["recipient_id", "recipient_type"], :name => "index_notifications_on_recipient_id_and_recipient_type"
  add_index "knotifications", ["recipient_id", "unread"], :name => "index_notifications_on_recipient_id_and_unread"

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opta_id"
  end

  create_table "locations", :force => true do |t|
    t.string  "foursquare_id"
    t.string  "name"
    t.string  "address",       :limit => 1024
    t.integer "opta_id"
  end

  add_index "locations", ["foursquare_id"], :name => "index_locations_on_foursquare_id", :unique => true

  create_table "notifications", :force => true do |t|
    t.integer  "recipient_id",                           :null => false
    t.string   "recipient_type",                         :null => false
    t.boolean  "read",                :default => false
    t.integer  "obj_id",                                 :null => false
    t.string   "obj_type",                               :null => false
    t.integer  "user_mentions_count", :default => 0
    t.integer  "team_mentions_count", :default => 0
    t.integer  "comments_count",      :default => 0
    t.integer  "likes_count",         :default => 0
    t.integer  "reshares_count",      :default => 0
    t.integer  "invites_count",       :default => 0
    t.integer  "starts_count",        :default => 0
    t.integer  "followers_count",     :default => 0
    t.integer  "mentioned_tag_id"
    t.string   "last_initiator_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "private",             :default => false
  end

  add_index "notifications", ["recipient_id", "recipient_type"], :name => "notifications_recipient_id_recipient_type_idx"
  add_index "notifications", ["recipient_id"], :name => "idx_on_recipient_id"

  create_table "oauth2_authorizations", :force => true do |t|
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "oauth2_resource_owner_type"
    t.integer  "oauth2_resource_owner_id"
    t.integer  "client_id"
    t.string   "scope"
    t.string   "code",                       :limit => 40
    t.string   "access_token_hash",          :limit => 40
    t.string   "refresh_token_hash",         :limit => 40
    t.datetime "expires_at"
  end

  add_index "oauth2_authorizations", ["access_token_hash"], :name => "index_oauth2_authorizations_on_access_token_hash", :unique => true
  add_index "oauth2_authorizations", ["client_id", "code"], :name => "index_oauth2_authorizations_on_client_id_and_code", :unique => true
  add_index "oauth2_authorizations", ["client_id", "oauth2_resource_owner_type", "oauth2_resource_owner_id"], :name => "index_owner_client_pairs", :unique => true
  add_index "oauth2_authorizations", ["client_id", "refresh_token_hash"], :name => "index_oauth2_authorizations_on_client_id_and_refresh_token_hash", :unique => true

  create_table "oauth2_clients", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "oauth2_client_owner_type"
    t.integer  "oauth2_client_owner_id"
    t.string   "name"
    t.string   "client_id"
    t.string   "client_secret_hash"
    t.string   "redirect_uri"
  end

  add_index "oauth2_clients", ["client_id"], :name => "index_oauth2_clients_on_client_id", :unique => true
  add_index "oauth2_clients", ["name"], :name => "index_oauth2_clients_on_name", :unique => true

  create_table "phone_numbers", :force => true do |t|
    t.integer  "account_id"
    t.string   "number"
    t.integer  "code"
    t.boolean  "confirmed",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "players", :force => true do |t|
    t.integer "jersey_num"
    t.string  "position"
    t.integer "team_id"
    t.integer "opta_id"
    t.integer "user_id"
    t.boolean "admin",      :default => false
    t.integer "rating",     :default => 0
  end

  add_index "players", ["opta_id"], :name => "index_players_on_opta_id"
  add_index "players", ["team_id"], :name => "players_team_id_idx"

  create_table "post_comments", :force => true do |t|
    t.integer  "commenter_id"
    t.integer  "post_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",           :limit => nil
    t.string   "commenter_type",                :default => "User", :null => false
  end

  add_index "post_comments", ["commenter_id", "commenter_type"], :name => "index_post_comments_on_commenter_id_and_commenter_type"
  add_index "post_comments", ["guid"], :name => "index_post_comments_on_guid", :unique => true
  add_index "post_comments", ["post_id"], :name => "index_post_comments_on_post_id"

  create_table "post_likes", :force => true do |t|
    t.integer  "liker_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "liker_type", :default => "User", :null => false
  end

  add_index "post_likes", ["liker_id", "liker_type"], :name => "index_post_likes_on_liker_id_and_liker_type"
  add_index "post_likes", ["post_id", "liker_id"], :name => "index_post_likes_on_post_id_and_user_id", :unique => true

  create_table "post_reshares", :force => true do |t|
    t.integer  "post_id"
    t.integer  "resharer_id"
    t.string   "network"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resharer_type", :default => "User", :null => false
  end

  add_index "post_reshares", ["post_id", "resharer_id", "resharer_type", "network"], :name => "unique_on_post_id_resharer_type_resharer_id_network", :unique => true
  add_index "post_reshares", ["resharer_id", "resharer_type"], :name => "index_post_reshares_on_resharer_id_and_resharer_type"

  create_table "post_tags", :force => true do |t|
    t.integer "post_id"
    t.integer "obj_id"
    t.string  "obj_type"
    t.string  "meta"
  end

  add_index "post_tags", ["post_id"], :name => "index_post_tags_on_post_id"

  create_table "post_targets", :force => true do |t|
    t.integer  "post_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target_type", :default => "User", :null => false
  end

  add_index "post_targets", ["id", "target_id"], :name => "post_targets_id_target_id_idx", :order => {"id"=>:desc}
  add_index "post_targets", ["post_id", "target_id", "target_type"], :name => "post_targets_post_id_target_id_target_type_key", :unique => true

  create_table "post_urls", :force => true do |t|
    t.string   "url"
    t.integer  "post_id"
    t.integer  "text_offset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "poster_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.float    "photo_ratio"
    t.boolean  "share_with_facebook"
    t.boolean  "share_with_twitter"
    t.integer  "likes_count",                            :default => 0
    t.integer  "comments_count",                         :default => 0
    t.integer  "event_id"
    t.string   "kind",                                   :default => "kyck", :null => false
    t.string   "video"
    t.string   "guid",                    :limit => nil
    t.boolean  "private",                                :default => false,  :null => false
    t.datetime "commented_at"
    t.datetime "liked_at"
    t.boolean  "processed",                              :default => true,   :null => false
    t.integer  "zencoder_output_id"
    t.integer  "posted_as_id"
    t.string   "posted_as_type"
    t.string   "transloadit_assembly_id"
    t.integer  "reshares_count",                         :default => 0
    t.string   "poster_type",                            :default => "User", :null => false
    t.boolean  "poster_was_private",                     :default => false,  :null => false
  end

  add_index "posts", ["guid"], :name => "index_posts_on_guid", :unique => true
  add_index "posts", ["id"], :name => "posts_id_idx", :order => {"id"=>:desc}
  add_index "posts", ["poster_id"], :name => "index_posts_on_user_id"
  add_index "posts", ["poster_type", "poster_id"], :name => "index_posts_on_poster_type_and_poster_id"
  add_index "posts", ["private"], :name => "index_posts_on_private"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "raw_stats", :force => true do |t|
    t.text    "headers"
    t.text    "params"
    t.text    "raw_post"
    t.text    "created_at"
    t.integer "game_id"
    t.string  "file_name"
    t.string  "feed_type"
    t.string  "period"
  end

  add_index "raw_stats", ["game_id"], :name => "raw_stats_game_id_idx"

  create_table "reserved_words", :force => true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reserved_words", ["word"], :name => "reserved_words_unique_index", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scraped_data", :force => true do |t|
    t.string   "title"
    t.string   "pub_date"
    t.string   "source_url"
    t.text     "content"
    t.string   "image_src"
    t.text     "tags"
    t.boolean  "posted",     :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "media_url"
    t.boolean  "deleted",    :default => false, :null => false
    t.text     "meta_data"
    t.string   "spider"
  end

  create_table "searches", :force => true do |t|
    t.tsvector "tsvector"
    t.integer  "obj_id"
    t.string   "obj_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["tsvector"], :name => "tsvector_gin"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type"], :name => "taggings_tag_taggable_unique_index", :unique => true
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "kind"
    t.text    "alias_list"
    t.text    "auto_tag_list"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true
  add_index "tags", ["owner_id", "owner_type"], :name => "idx_owner_type_owner_id"

  create_table "team_invites", :force => true do |t|
    t.integer  "team_id"
    t.string   "requester_type"
    t.integer  "requester_id"
    t.string   "kind",           :default => "invite", :null => false
    t.string   "guid",                                 :null => false
    t.integer  "recipient_id",                         :null => false
    t.string   "recipient_type",                       :null => false
    t.string   "status",         :default => "sent",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name",                           :limit => 1024
    t.text     "description"
    t.string   "icon"
    t.float    "icon_ratio"
    t.string   "url"
    t.integer  "league_id"
    t.integer  "league_position"
    t.integer  "opta_id"
    t.string   "abbreviation"
    t.integer  "account_id"
    t.integer  "favorites_count",                                :default => 0
    t.integer  "followers_count"
    t.integer  "stadium_location_id"
    t.string   "kind",                                           :default => "system"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating",                                         :default => 0
    t.string   "header_image"
    t.string   "header_transloadit_assembly_id"
    t.string   "icon_transloadit_assembly_id"
    t.string   "location"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.integer  "followings_count"
    t.boolean  "private"
    t.integer  "favorited_by_count",                             :default => 0,        :null => false
    t.boolean  "claimed",                                        :default => false,    :null => false
    t.integer  "invites_count",                                  :default => 0,        :null => false
    t.integer  "players_count",                                  :default => 0,        :null => false
    t.integer  "parent_id"
  end

  add_index "teams", ["account_id"], :name => "index_teams_on_user_id"
  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true
  add_index "teams", ["opta_id"], :name => "index_teams_on_opta_id"

  create_table "things", :force => true do |t|
    t.string "name", :limit => 1024
  end

  create_table "tv_channels", :force => true do |t|
    t.string "name"
    t.string "icon"
    t.string "icon_ratio"
  end

  create_table "user_device_tokens", :id => false, :force => true do |t|
    t.integer  "id",                                     :null => false
    t.integer  "user_id"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "environment", :default => "development", :null => false
  end

  create_table "user_favorites", :force => true do |t|
    t.integer  "favoriter_id"
    t.integer  "obj_id"
    t.string   "obj_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favoriter_type", :default => "User", :null => false
  end

  add_index "user_favorites", ["favoriter_id", "favoriter_type"], :name => "index_user_favorites_on_favoriter_id_and_favoriter_type"
  add_index "user_favorites", ["favoriter_id", "obj_id", "obj_type"], :name => "index_user_favorites_on_user_id_and_obj_id_and_obj_type", :unique => true
  add_index "user_favorites", ["favoriter_id"], :name => "index_user_favorites_on_user_id"
  add_index "user_favorites", ["obj_id", "obj_type"], :name => "index_user_favorites_on_obj_id_and_obj_type"

  create_table "user_relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "following_type"
    t.boolean  "pending",        :default => false
    t.string   "follower_type",  :default => "User", :null => false
  end

  add_index "user_relationships", ["follower_id", "follower_type", "following_id", "following_type"], :name => "user_relationships_follower_unique_index", :unique => true

  create_table "user_settings", :id => false, :force => true do |t|
    t.integer "id",                                                              :null => false
    t.boolean "notify_on_post_liked_via_email",                :default => true, :null => false
    t.boolean "notify_on_post_liked_via_push",                 :default => true, :null => false
    t.boolean "notify_on_post_commented_via_email",            :default => true, :null => false
    t.boolean "notify_on_post_commented_via_push",             :default => true, :null => false
    t.boolean "notify_on_comment_replied_via_email",           :default => true, :null => false
    t.boolean "notify_on_comment_replied_via_push",            :default => true, :null => false
    t.boolean "notify_on_user_followed_via_email",             :default => true, :null => false
    t.boolean "notify_on_user_followed_via_push",              :default => true, :null => false
    t.boolean "notify_on_user_mentioned_via_email",            :default => true, :null => false
    t.boolean "notify_on_user_mentioned_via_push",             :default => true, :null => false
    t.boolean "notify_on_user_directed_via_email",             :default => true, :null => false
    t.boolean "notify_on_user_directed_via_push",              :default => true, :null => false
    t.integer "user_id"
    t.boolean "notify_on_user_mentioned_in_comment_via_push",  :default => true, :null => false
    t.boolean "notify_on_user_mentioned_in_comment_via_email", :default => true, :null => false
    t.boolean "notify_on_event_will_start_soon_via_push",      :default => true, :null => false
    t.boolean "notify_on_event_will_start_soon_via_email",     :default => true, :null => false
    t.boolean "notify_on_event_invite_via_push",               :default => true
    t.boolean "notify_on_event_invite_via_email",              :default => true
    t.boolean "notify_on_private_kyck_via_push",               :default => true
    t.boolean "notify_on_private_kyck_via_email",              :default => true
    t.boolean "notify_on_post_reshared_via_push",              :default => true
    t.boolean "notify_on_post_reshared_via_email",             :default => true
  end

  create_table "user_traces", :force => true do |t|
    t.integer  "account_id"
    t.string   "trace_type"
    t.text     "data"
    t.datetime "created_at"
    t.string   "page"
    t.string   "session"
    t.string   "track_session"
    t.string   "request_path"
    t.string   "action"
    t.string   "scope"
    t.integer  "obj_id"
    t.string   "requested_kind"
    t.string   "requested_from"
    t.string   "user_agent"
  end

  add_index "user_traces", ["account_id"], :name => "index_user_traces_on_account_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.float    "avatar_ratio"
    t.boolean  "admin",                          :default => false,  :null => false
    t.text     "description"
    t.string   "link"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "kind",                           :default => "user", :null => false
    t.datetime "followed_at"
    t.datetime "following_at"
    t.integer  "followers_count",                :default => 0,      :null => false
    t.integer  "followings_count",               :default => 0,      :null => false
    t.string   "header_image"
    t.integer  "favorites_count",                :default => 0
    t.string   "location"
    t.string   "avatar_transloadit_assembly_id"
    t.string   "header_transloadit_assembly_id"
    t.boolean  "private",                        :default => false
    t.integer  "account_id",                     :default => -1,     :null => false
    t.boolean  "visible",                        :default => true,   :null => false
    t.integer  "favorited_by_count",             :default => 0,      :null => false
    t.boolean  "claimed",                        :default => true,   :null => false
  end

  add_index "users", ["account_id"], :name => "index_on_account_id"

end
