#!/bin/bash
# UCLI Tools Community Repository Setup Script
# This script helps set up GitHub Discussions and other repository features

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 UCLI Tools Community Repository Setup${NC}"
echo ""

# Check if gh CLI is installed
if ! command -v gh > /dev/null 2>&1; then
    echo -e "${RED}❌ GitHub CLI (gh) is not installed${NC}"
    echo "Please install it from: https://cli.github.com/"
    echo ""
    echo "Installation commands:"
    echo "  macOS: brew install gh"
    echo "  Ubuntu: curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh"
    echo "  Windows: winget install --id GitHub.cli"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  You need to authenticate with GitHub CLI first${NC}"
    echo "Run: gh auth login"
    exit 1
fi

echo -e "${GREEN}✅ GitHub CLI is installed and authenticated${NC}"
echo ""

# Repository information
REPO_OWNER="ucli-tools"
REPO_NAME="community"

echo -e "${BLUE}📋 Repository Setup Checklist:${NC}"
echo ""

# Check if repository exists
if gh repo view "$REPO_OWNER/$REPO_NAME" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Repository exists: $REPO_OWNER/$REPO_NAME${NC}"
else
    echo -e "${RED}❌ Repository does not exist: $REPO_OWNER/$REPO_NAME${NC}"
    echo "Please create the repository first:"
    echo "  https://github.com/new"
    echo "  Owner: $REPO_OWNER"
    echo "  Name: $REPO_NAME"
    exit 1
fi

# Check if Discussions are enabled
echo -e "${BLUE}Checking GitHub Discussions...${NC}"
if gh api repos/$REPO_OWNER/$REPO_NAME -q '.has_discussions // false' | grep -q true; then
    echo -e "${GREEN}✅ GitHub Discussions are enabled${NC}"
else
    echo -e "${YELLOW}⚠️  GitHub Discussions are NOT enabled${NC}"
    echo ""
    echo -e "${BLUE}To enable GitHub Discussions:${NC}"
    echo "1. Go to: https://github.com/$REPO_OWNER/$REPO_NAME"
    echo "2. Click 'Settings' tab"
    echo "3. Scroll down to 'Features' section"
    echo "4. Check 'Discussions'"
    echo "5. Click 'Save changes'"
    echo ""
    echo -e "${YELLOW}Alternatively, run this API call:${NC}"
    echo "gh api repos/$REPO_OWNER/$REPO_NAME -X PATCH -F has_discussions=true"
fi

# Check repository description
echo -e "${BLUE}Checking repository description...${NC}"
DESCRIPTION=$(gh repo view "$REPO_OWNER/$REPO_NAME" --json description -q .description)
if [[ "$DESCRIPTION" == *"UCLI Tools community"* ]]; then
    echo -e "${GREEN}✅ Repository description is set correctly${NC}"
else
    echo -e "${YELLOW}⚠️  Repository description may need updating${NC}"
    echo "Current: $DESCRIPTION"
    echo "Suggested: 'UCLI Tools community hub for discussions, questions, and collaboration'"
fi

# Check repository topics
echo -e "${BLUE}Checking repository topics...${NC}"
TOPICS=$(gh repo view "$REPO_OWNER/$REPO_NAME" --json repositoryTopics -q .repositoryTopics[].name 2>/dev/null || echo "")
EXPECTED_TOPICS=("cli" "tools" "automation" "community" "discussions")

MISSING_TOPICS=()
for topic in "${EXPECTED_TOPICS[@]}"; do
    if [[ ! "$TOPICS" =~ $topic ]]; then
        MISSING_TOPICS+=("$topic")
    fi
done

if [ ${#MISSING_TOPICS[@]} -eq 0 ]; then
    echo -e "${GREEN}✅ Repository topics are set correctly${NC}"
else
    echo -e "${YELLOW}⚠️  Missing repository topics: ${MISSING_TOPICS[*]}${NC}"
    echo "Consider adding these topics for better discoverability"
fi

# Check if repository is public
echo -e "${BLUE}Checking repository visibility...${NC}"
VISIBILITY=$(gh repo view "$REPO_OWNER/$REPO_NAME" --json visibility -q .visibility)
if [[ "$VISIBILITY" == "PUBLIC" ]]; then
    echo -e "${GREEN}✅ Repository is public${NC}"
else
    echo -e "${YELLOW}⚠️  Repository visibility: $VISIBILITY${NC}"
    echo "Community repositories should typically be public"
fi

echo ""
echo -e "${BLUE}🎯 Next Steps:${NC}"
echo ""
echo "1. Enable GitHub Discussions (see instructions above)"
echo "2. Set repository description and topics"
echo "3. Create initial discussion categories:"
echo "   - General"
echo "   - Ideas"
echo "   - Q&A"
echo "   - Show and tell"
echo "   - Announcements"
echo ""
echo "4. Pin important discussions:"
echo "   - Welcome to UCLI Tools Community"
echo "   - Getting Started Guide"
echo "   - Contributing Guidelines"
echo ""
echo "5. Set up repository automation:"
echo "   - Issue templates"
echo "   - Pull request templates"
echo "   - Branch protection rules"

echo ""
echo -e "${GREEN}🎉 Community repository setup check complete!${NC}"
