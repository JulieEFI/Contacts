<apex:page controller="ContactsController">
    <apex:form >
        <apex:pageBlock title="Contacts List" id="contacts_list">
          <apex:pageBlockTable value="{! contacts }" var="ct">
    <apex:column value="{! ct.Id }"/>
   <apex:column value="{! ct.Name }">
    <apex:facet name="header">
        <apex:commandLink action="{! sortByName }"
            reRender="contacts_list"> Name
        </apex:commandLink>
    </apex:facet>
</apex:column>
    <apex:column value="{! ct.Birthdate }"/>
    <apex:column value="{! ct.MobilePhone }"/>
</apex:pageBlockTable>
        </apex:pageBlock>
    </apex:form>
</apex:page>
                  