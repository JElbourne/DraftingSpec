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
        it 'DOES NOT allow visitor to view NEW Project form' do
            visit new_project_path()
            expect(current_path).to eq new_user_session_path()
        end

        it 'allow USER to view NEW Project form' do
            user = FactoryBot.create(:user)

            login_as(user, scope: :user)             

            visit new_project_path()
            expect(current_path).to eq new_project_path()

            visit projects_path()
            click_link "New Project"
            expect(current_path).to eq new_project_path()
        end
    end

    describe 'VISIT #CREATE' do
        it 'allow USER to CREATE new Project' do
            user = FactoryBot.create(:user)

            login_as(user, scope: :user)             

            visit new_project_path()
            fill_in 'project_name', with: "New Cool Project"
            fill_in 'project_address', with: "Fake Neat Address"
            fill_in 'project_filenumber', with: "19-001"
            click_button 'Create Project'

            projects = user.reload.projects

            expect(projects.count).to eq (1)
            expect(projects.last.name).to eq ("New Cool Project")
            
            new_project = projects.last

            expect(current_path).to eq project_path(6)
        end
    end

    describe 'VISIT #EDIT' do

        before(:each) do
            @user = FactoryBot.create(:user)
            @project = FactoryBot.create(:project, user: @user)
        end
        
        it 'DOES NOT allow visitor to view EDIT project form' do
            visit edit_project_path(@project)
            expect(current_path).to eq user_session_path
            expect(page).to have_selector('#message', text: 'You need to sign in or sign up before continuing.')
        end

        it 'DOES NOT allow Non-owner User to view EDIT project form' do
            user = FactoryBot.create(:user, password: 'password')
            login_as(user, scope: :user)

            visit edit_project_path(@project)
            expect(current_path).to eq projects_path
            expect(page).to have_selector('#message', text: 'Project Not Found.')
        end

        it 'does allow Owner User to view EDIT project form' do
            login_as(@user, scope: :user)
            
            visit edit_project_path(@project)
            expect(current_path).to eq edit_project_path(@project)
        end
    end

    describe 'VISIT #UPDATE' do
        it 'allows Owner User to UPDATE course' do
            user = FactoryBot.create(:user, password: 'password')
            login_as(user, scope: :user)
            existing_project = FactoryBot.create(:project, user: user)
            
            visit edit_project_path(existing_project)
            fill_in 'project_name', with: 'Wow updated'
            click_button 'Update Project'

            latest_project = user.projects.last
            expect(current_path).to eq project_path(latest_project)
            expect(latest_project.name).to eq 'Wow updated'
        end
    end

    describe 'VISIT #DESTROY' do
        it 'allows Admin to DESTROY course' do
            user = FactoryBot.create(:user, password: 'password')
            login_as(user, scope: :user)
            existing_project = FactoryBot.create(:project, user: user)
            
            visit edit_project_path(existing_project)
            click_link 'Destroy'

            expect(current_path).to eq projects_path
            expect(Project.count).to eq 0
        end
    end
end