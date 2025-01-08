improved_erd = Digraph(format='png')
improved_erd.attr(rankdir='LR', size='12,10')
improved_erd.attr('node', shape='record', fontsize='12')

improved_erd.node('Properties', '''{ Properties | { <PK> PropertyID (PK) | Address | City | Type | Size | Price | Status }}''')
improved_erd.node('Agents', '''{ Agents | { <PK> AgentID (PK) | Name | ContactNumber (Unique) | CommissionRate }}''')
improved_erd.node('Clients', '''{ Clients | { <PK> ClientID (PK) | Name | ContactNumber (Unique) | Email (Unique) | Preferences }}''')
improved_erd.node('Transactions', '''{ Transactions | { <PK> TransactionID (PK) | <FK1> PropertyID (FK) | <FK2> AgentID (FK) | <FK3> ClientID (FK) | TransactionType | Date | Amount }}''')

improved_erd.edge('Properties:PK', 'Transactions:FK1', label='1', arrowhead='crow', arrowtail='none')
improved_erd.edge('Agents:PK', 'Transactions:FK2', label='1', arrowhead='crow', arrowtail='none')
improved_erd.edge('Clients:PK', 'Transactions:FK3', label='1', arrowhead='crow', arrowtail='none')

improved_output_path = '/mnt/data/Improved_ERD_Crows_Foot'
improved_erd.render(improved_output_path, format='png', cleanup=True)

improved_output_path + '.png'
