package iit.csp584.soccerfan.dao;

import iit.csp584.soccerfan.bean.Player;
import iit.csp584.soccerfan.utility.GetMySQLConnenction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PlayerDaoImpl implements PlayerDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    @Override
    public void add(Player player) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO player values(?,?,?,?,?,?) ");
            preparedStatement.setString(1, player.getId());
            preparedStatement.setString(2, player.getName());
            preparedStatement.setString(3, player.getAge());
            preparedStatement.setString(4,player.getTeamid());
            preparedStatement.setString(5,player.getNumber());
            preparedStatement.setString(6,player.getPosition());
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void delete(String s) {
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("delete from player where id = ? ");
            preparedStatement.setString(1,s );
            preparedStatement.execute();
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Player> getAll() {
        List<Player> l = new ArrayList<>();
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from player ");

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String age = resultSet.getString("age");
                String teamid = resultSet.getString("teamid");
                String number = resultSet.getString("number");
                String position = resultSet.getString("position");
                Player player = new Player(id, name, age,teamid,number,position);
                l.add(player);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    @Override
    public Player getById(String s) {
        Player player = null;
        try {
            connection = GetMySQLConnenction.getConnection();
            preparedStatement = connection.prepareStatement("select * from player where id = ? ");
            preparedStatement.setString(1, s);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String age = resultSet.getString("age");
                String teamid = resultSet.getString("teamid");
                String number = resultSet.getString("number");
                String position = resultSet.getString("position");
                player = new Player(id, name, age,teamid,number,position);
            }
            GetMySQLConnenction.getClose(connection, preparedStatement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return player;
    }
}
