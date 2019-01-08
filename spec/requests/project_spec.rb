describe 'Project', type: :feature do

    describe 'VISIT #INDEX' do
        it 'DOES NOT allow visitor to view Project list page' do
            visit projects_path()
            expect(current_path).to eq new_user_session_path()
        end

        it 'allows USER to view Project list page' do
            user = FactoryBot.create(:user)
            project1 = FactoryBot.create(:project, user: user)
            project2 = FactoryBot.create(:project)

            login_as(user, scope: :user)

            visit projects_path()
            expect(current_path).to eq projects_path()
            expect(page).to have_content(project1.name)
            expect(page).to_not have_content(project2.name)
        end
    end

    describe 'VISIT #SHOW' do
        it 'DOES NOT allow visitor to view Projects show page' do
            project = FactoryBot.create(:project)

            visit project_path(project)
            expect(current_path).to eq new_user_session_path()
        end

        it 'allow USER to view Projects show page' do
            user = FactoryBot.create(:user)
            project1 = FactoryBot.create(:project, user: user)
            project2 = FactoryBot.create(:project)

            login_as(user, scope: :user)

            visit project_path(project1)
            expect(current_path).to eq project_path(project1)

            visit project_path(project2)
            expect(current_path).to eq projects_path()

            visit projects_path()
            click_link project1.name
            expect(current_path).to eq project_path(project1)
        end
    end 

    describe 'VISIT #NEW' do
        it 'DOES NOT allow visitor to view NEW Purchase form' do
            visit new_project_path()
            expect(current_path).to eq new_user_session_path()
        end

        it 'allow USER to view NEW Purchase form' do
            user = FactoryBot.create(:user)

            login_as(user, scope: :user)             

            visit new_project_path()
            expect(current_path).to eq new_project_path()

            visit projects_path()
            click_link "New Project"
            expect(current_path).to eq new_project_path()

        end
    end
end