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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "edprojectattributes", id: false, force: :cascade do |t|
    t.string "sourceid",             limit: 80
    t.string "sourceattributename",  limit: 80
    t.string "attributedescription", limit: 160
    t.string "relationname",         limit: 100
    t.string "domain",               limit: 100
    t.string "classattributename",   limit: 100
  end

  create_table "multiyearrates", primary_key: ["schoolid", "startyear", "timeperiod"], force: :cascade do |t|
    t.integer "schoolid",                                 null: false
    t.string  "startyear",                     limit: 10, null: false
    t.integer "timeperiod",                               null: false
    t.string  "totalcohort",                   limit: 20
    t.string  "totalgrads",                    limit: 20
    t.float   "male"
    t.float   "female"
    t.float   "white"
    t.float   "hispanic"
    t.float   "black"
    t.float   "asian"
    t.float   "multiracial"
    t.float   "americanindianalaskan"
    t.float   "specialed"
    t.float   "econdisadv"
    t.float   "migrant"
    t.float   "ell"
    t.float   "nativehawaiianpacificislander"
    t.string  "endyear",                       limit: 10
    t.index ["schoolid", "startyear", "timeperiod"], name: "multiid", unique: true, using: :btree
  end

  create_table "school", primary_key: "school_id", id: :integer, force: :cascade do |t|
    t.integer "aun"
    t.string  "school_name", limit: 200
    t.string  "county",      limit: 200
    t.string  "school_type",        limit: 20
    t.string  "lea",         limit: 75
    t.index ["school_id", "aun"], name: "idandaun", unique: true, using: :btree
  end

  create_table "sources", id: false, force: :cascade do |t|
    t.integer "sourceid"
    t.string  "sourceorganization", limit: 200
    t.string  "shortname",          limit: 100
    t.string  "sourcename",         limit: 200
    t.string  "sourceurl",          limit: 500
    t.string  "lastaccessed",       limit: 100
  end

  create_table "tempcohort", id: false, force: :cascade do |t|
    t.string  "leatype",                       limit: 10
    t.integer "aun"
    t.string  "lea",                           limit: 75
    t.integer "schoolid"
    t.string  "name",                          limit: 75
    t.string  "type",                          limit: 10
    t.string  "totalgrads",                    limit: 20
    t.string  "totalcohorts",                  limit: 20
    t.float   "male"
    t.float   "female"
    t.float   "white"
    t.float   "hispanic"
    t.float   "black"
    t.float   "americanindianalaskan"
    t.float   "multiracial"
    t.float   "nativehawaiianpacificislander"
    t.float   "asian"
    t.float   "econdisadv"
    t.float   "migrant"
    t.float   "ell"
    t.float   "specialed"
    t.integer "startyear"
    t.integer "timeperiod"
  end

  create_table "tempgrads", id: false, force: :cascade do |t|
    t.string  "county",                         limit: 20
    t.integer "aun"
    t.string  "lea",                            limit: 75
    t.integer "schoolid"
    t.string  "name",                           limit: 75
    t.string  "totalgrads",                     limit: 20
    t.float   "totalcollegebound"
    t.float   "totalcollegeboundpercent"
    t.float   "twofouryearcollege"
    t.float   "twofourcollegeyearpercent"
    t.float   "totalpostsecondarybound"
    t.float   "totalpostsecondaryboundpercent"
    t.float   "ndgpss"
    t.float   "ndgpsspercent"
    t.float   "specializedegree"
    t.float   "specializeddegreepercent"
    t.integer "startyear"
  end

  create_table "versioncontrol", id: false, force: :cascade do |t|
    t.integer "versionnumber"
    t.date    "releasedate"
  end

  create_table "yearlyrates", primary_key: ["schoolid", "startyear"], force: :cascade do |t|
    t.integer "schoolid",                             null: false
    t.integer "startyear",                            null: false
    t.string  "totalgrads",                limit: 20
    t.float   "twofouryearcollegepercent"
    t.float   "specializeddegreepercent"
    t.float   "totalcollegeboundpercent"
    t.float   "totalndgpsspercent"
    t.float   "totalpostsecondarypercent"
    t.string  "endyear",                   limit: 10
    t.index ["schoolid", "startyear"], name: "yearlyid", unique: true, using: :btree
  end

  add_foreign_key "multiyearrates", "school", column: "schoolid", primary_key: "school_id", name: "id"
  add_foreign_key "yearlyrates", "school", column: "schoolid", primary_key: "school_id", name: "id"
end
