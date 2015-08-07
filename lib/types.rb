module Types
  ValidEmailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  Gender = [
    ['Male', 'm'],
    ['Female', 'f'],
  ]

  AreaOfExpertise = [
    ['RoR', 'rails'],
    [".Net", 'dotnet'],
    ["C#", 'csharp'],
    ["C++", 'cpp'],
    ['Java', 'java'],
    ['PHP', 'php'],
    ['QA', 'qa'],
    ['IOS', 'ios'],
    ['HTML', 'html'],
    ['JavaScript', 'javascript'],
    ['UI/UX Design', 'uiuxdesign'],
    ['Unity', 'unity'],
    ['Web Design', 'webdesign'],
    ['Android', 'android'],
    ['Flash', 'flash'],
  ]

  Post = [
    ['Junior', 'junior'],
    ['Middle', 'middle'],
    ['Senior', 'senior'],
    ['Project Manager', 'pm'],
    ['Scrum Master', 'scrum'],
    ['Lead Software Engineer', 'leadsofteng'],
  ]

  AllDocuments = [
    "application/pdf",
    "application/vnd.ms-excel",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/vnd.oasis.opendocument.text",
    "application/vnd.oasis.opendocument.formula",
    "text/plain"
  ]

  GoogleViewerDocuments = [
    "application/pdf",
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  ]
end

ActiveRecord::Base.extend Types